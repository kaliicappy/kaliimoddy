-- Fake Transparency Enhancement
SMODS.Atlas{
    key = 'faketp',
    path = 'fakeenhance.png',
    px = 71,
    py = 95,
}

SMODS.Enhancement {
    key = 'faketp',
    type = 'modifier',
    atlas = 'faketp',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xmult = 2,
            odds = 4
        }
    },
    shatters = false,

    loc_txt = {
        name = "Fake Transparent PNG",
        text = {
            "{C:green}1 in #2#{} chance to gain {X:mult,C:white}X#1#{} {C:mult}Mult{} when scored"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.xmult,
                self.config.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'faketp', 1, self.config.extra.odds) then
                return {
                    x_mult = self.config.extra.xmult,
                    colour = G.C.MULT
                }
            end
        end
    end,
}

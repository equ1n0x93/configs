from IPython.core.magic import register_line_magic
import cProfile
import pstats
@register_line_magic
def profile(line):
    cProfile.run(line, 'magic_stats')
    stats = pstats.Stats('magic_stats')
    print stats.sort_stats('cumulative').print_stats(20)
    return stats

From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] cputime: clean up cputime_to_usecs and usecs_to_cputime macros
Date: Wed, 17 Aug 2011 16:02:49 +0200
Message-ID: <201108171602.49444.arnd@arndb.de>
References: <20110802170249.GA23698@tiehlicka.suse.cz> <cover.1312544541.git.mhocko@suse.cz> <c6c176ace7eca5fffe568865193a1061d181c77c.1312544541.git.mhocko@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <c6c176ace7eca5fffe568865193a1061d181c77c.1312544541.git.mhocko@suse.cz>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Michal Hocko <mhocko@suse.cz>
Cc: linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, cpufreq@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>

On Thursday 04 August 2011, Michal Hocko wrote:
> get rid of semicolon so that those expressions can be used also
> somewhere else than just in an assignment.
> 
> Signed-off-by: Michal Hocko <mhocko@suse.cz>

Acked-by: Arnd Bergmann <arnd@arndb.de>

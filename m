From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [2.6 patch] small cpufreq cleanup
Date: Sat, 30 Oct 2004 09:38:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041030073843.GA8075@dominikbrodowski.de>
References: <20041030072246.GG4374@stusta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041030072246.GG4374@stusta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

On Sat, Oct 30, 2004 at 09:22:46AM +0200, Adrian Bunk wrote:
> the patch below does the following cleanups in the cpufreq code:
> - remove the __deprecated cpufreq_set{,max} functions that didn't have
>   any users left

Not yet, the #warning says it'll be removed 2005-01-01.

> - make cpufreq_gov_dbs static

Patch which does that is already in cpufreq-bk.

> cpufreq_driver_target and cpufreq_governor in drivers/cpufreq/cpufreq.c 
> also both have currently exactly zero in-kernel users, but I left them.

cpufreq_driver_target and/or cpufreq_governor should already be used by some
code, but aren't yet, but definitely will be useful and used soon.

	Dominik

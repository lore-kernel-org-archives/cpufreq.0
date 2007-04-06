From: Adrian Bunk <bunk@stusta.de>
Subject: Re: [2.6 patch] the overdue removal of X86_SPEEDSTEP_CENTRINO_ACPI
Date: Sat, 7 Apr 2007 00:38:21 +0200
Message-ID: <20070406223821.GL29169@stusta.de>
References: <20070220000641.GG13958@stusta.de> <4616CA22.7040005@tmr.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4616CA22.7040005@tmr.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Davidsen <davidsen@tmr.com>
Cc: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Fri, Apr 06, 2007 at 06:30:58PM -0400, Bill Davidsen wrote:
> Adrian Bunk wrote:
> >This patch contains the overdue removal of X86_SPEEDSTEP_CENTRINO_ACPI.
> >
> >Signed-off-by: Adrian Bunk <bunk@stusta.de>
> >
> It would be really nice, when removing features used on computers which 
> are only a few years old, if you noted what replaces this functionality. 
> Yes, people can take 10-15 minutes to find and read previous discussion, 
> but one or two sentences who generate less concern and noise on the list.

For everyone on linux-kernel, the text my patch removes in 
feature-removal-schedule.txt should be sufficient.

Users already had a printk() stating that it was deprecated.

> Bill Davidsen

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

From: Adrian Bunk <bunk@stusta.de>
Subject: Status of X86_P4_CLOCKMOD?
Date: Thu, 23 Feb 2006 20:59:37 +0100
Message-ID: <20060223195937.GA5087@stusta.de>
References: <20060214152218.GI10701@stusta.de> <20060222024438.GI20204@MAIL.13thfloor.at> <20060222031001.GC4661@stusta.de> <200602212220.05642.dtor_core@ameritech.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751778AbWBWT7k@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200602212220.05642.dtor_core@ameritech.net>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>
Cc: Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk

On Tue, Feb 21, 2006 at 10:20:04PM -0500, Dmitry Torokhov wrote:
> On Tuesday 21 February 2006 22:10, Adrian Bunk wrote:
> > On Wed, Feb 22, 2006 at 03:44:38AM +0100, Herbert Poetzl wrote:
> > > 
> > >  config X86_P4_CLOCKMOD
> > > 	depends on EMBEDDED
> > 
> > This one is an x86_64 only issue, and yes, it's wrong.
> 
> That's for P4, not X86_64... And since P4 clock modulation does not provide
> almost any energy savings it was "hidden" under embedded.

But the EMBEDDED dependency is only on x86_64:

arch/i386/kernel/cpu/cpufreq/Kconfig:
config X86_P4_CLOCKMOD
        tristate "Intel Pentium 4 clock modulation"
        select CPU_FREQ_TABLE
        help

arch/x86_64/kernel/cpufreq/Kconfig:
config X86_P4_CLOCKMOD
        tristate "Intel Pentium 4 clock modulation"
        depends on EMBEDDED
        help

And if the option is mostly useless, what is it good for?

> Dmitry

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

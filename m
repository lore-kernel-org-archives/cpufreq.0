From: Daniel Thor Kristjansson <danielk@cat.nyu.edu>
Subject: Re: Feature request
Date: Thu, 28 Aug 2003 12:04:11 -0400 (EDT)
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <Pine.SOL.4.53.0308281159210.27626@graphics.cat.nyu.edu>
References: <000001c3694b$6b4eb5d0$0200a8c0@informatik.domaene>
	<3F473898.4020101@gotiao.com> <3F4746DB.9080303@gotiao.com>
	<20030826231001.GB31977@brodo.de> <3F4CE772.9090605@gotiao.com>
	<20030828135036.GA17216@brodo.de>
Reply-To: danielk@mrl.nyu.edu
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20030828135036.GA17216@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: Viktor Radnai <efti@gotiao.com>, cpufreq@www.linux.org.uk


My laptop has C2 and ACPI throttling still saves and additional 500mW +
manages to cool the CPU enough to get the fan turned off.

Cpufreq cools the cpu more, but I've yet to get a kernel to run with
both cpufreq + tcp/ip4 so I'm stuck with ACPI throttling for now.

-- Daniel
  << When truth is outlawed; only outlaws will tell the truth. >> - RLiegh

On Thu, 28 Aug 2003, Dominik Brodowski wrote:

]On Thu, Aug 28, 2003 at 03:16:34AM +1000, Viktor Radnai wrote:
]> Dominik Brodowski wrote:
]> >Oh well, so users want to use 150 MHz instead of 1600 MHz now...
]> My laptop is still quite responsive at 150MHz and anything that lets me
]> conserve battery power when the performance isn't needed is worth
]> trying. After all, this is the very purpose of frequency scaling. It
]> doesn't really matter how fast the kernel executes idle loops ;)
]
]Well, does your computer do some real "idling" - e.g. ACPI C-States [C2 and
]above] or APM "halt"? If so, then you don't need any throttling - it saves
]approximately the same amount of energy.
]
]> >worthy of discussion for 2.7.
]> That would be great, too bad that it won't happen sooner. In the
]> meantime, do you think that the method described below is an acceptable
]> way of saving power or do you foresee any potential problems /
]> instability as a result of this?
]>
]> If you think that this is a workable method then I might hack one of the
]> userspace frequency scaling utilities to support this method.
]
]As most systems support either ACPI-C-States or APM "halt" and these methods
]are as "good" for power saving, I don't see a reason to implement this at
]the moment.
]
]	Dominik
]
]_______________________________________________
]Cpufreq mailing list
]Cpufreq@www.linux.org.uk
]http://www.linux.org.uk/mailman/listinfo/cpufreq
]

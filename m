From: Daniel Thor Kristjansson <danielk@cat.nyu.edu>
Subject: Re: Dynamic frequency governor
Date: Mon, 20 Oct 2003 11:40:37 -0400 (EDT)
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <Pine.SOL.4.53.0310201124370.3590@graphics.cat.nyu.edu>
References: <CFF522B18982EA4481D3A3E23B83141C24B4AA@orsmsx407.jf.intel.com>
Reply-To: danielk@mrl.nyu.edu
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <CFF522B18982EA4481D3A3E23B83141C24B4AA@orsmsx407.jf.intel.com>
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
To: "Moore, Robert" <robert.moore@intel.com>
Cc: cpufreq@www.linux.org.uk


I made a list here:
  http://www.mrl.nyu.edu/~danielk/linux/cpufreq.html

I just added Jeroen van der Vegt's slowmotion.

I'm going to second everyone else that's written one of these and say
that it should be in userspace. Before I got to busy, my plan was to
make a server that ran an interpreted policy from a file. An applet
running under either kde or gnome would tell it which one to use via a
unix socket. I can post the latest version I wrote, but it's not
thread safe and not secure against buffer overflows (which is why I kept
it to myself).

BTW If you require KDE it already has a system information server that
will tell you if you are running on battery, and more detailed CPU
utilization info than uptime will give you. I also allowed setting CPU
speed based on temperature in addition to battery capacity and uptime,
sometimes I leave a laptop in my lap where I'm sensitive to a 80 deg
Centigrade CPU.... So sometimes, for 65C CPU, I can bear a sligtly
longer compile even if slowing the CPU uses more battery for the
process, especially if I'm plugged in anyway.

-- Daniel
  << When truth is outlawed; only outlaws will tell the truth. >> - RLiegh

On Fri, 17 Oct 2003, Moore, Robert wrote:

]Hi all,
]
]I've been chartered to implement a multi-state algorithm for Linux;
]this will be a new governor that adjusts the CPU frequency based upon
]percent CPU utilization as reported from the kernel idle handler.
]
]Has any work been done (or is being done) in this area?  I don't want to
]rewrite the wheel.
]
]Thanks,
]Bob Moore
]Intel Corporation
]
]_______________________________________________
]Cpufreq mailing list
]Cpufreq@www.linux.org.uk
]http://www.linux.org.uk/mailman/listinfo/cpufreq
]

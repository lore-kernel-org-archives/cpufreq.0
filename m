From: Daniel Thor Kristjansson <danielk@cat.nyu.edu>
Subject: Re: Cpufreq: powernow-k7 weirdness
Date: Mon, 7 Jul 2003 12:32:22 -0400 (EDT)
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <Pine.SOL.4.53.0307071212001.24298@graphics.cat.nyu.edu>
References: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr>
 <200307071129.46683.mflt1@micrologica.com.hk> <20030707131252.GC7796@poupinou.org>
 <200307072306.13290.mflt1@micrologica.com.hk>
Reply-To: danielk@mrl.nyu.edu
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <200307072306.13290.mflt1@micrologica.com.hk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Frank <mflt1@micrologica.com.hk>
Cc: Ducrot Bruno <ducrot@poupinou.org>, Luigi Belli <lbelli@crema.unimi.it>, cpufreq@www.linux.org.uk


I'm not a mainboard designer but I play one on TV...

1/ I have had two laptops from Sony's FX series and the later
   one required three times as much power, but had the same
   power supply, regulator and batteries.

2/ An EE friend of mine worked at a large computer maker and complained
   bitterly about designers just cut-n-pasting power supplies and
   regulators from older designs that had very different power
   requirements.

I wouldn't be too surprised if a lot of laptops have underpowered power
supplies. It would be better to give a large timing leeway by default,
but expose a mechanism for speeding the switching up in the /sys
filesystem.

Is it possible to do the speed change seperately from the voltage
scaling? Perhaps when slowing down the CPU, you can slow it down
immediately, then slowly scale the voltage down. You might also be able
to scale up the voltage quicker if you do it independently of the
frequency scaling. A higher frequency is going to lead to the CPU
drawing more current, It might be better to first charge up the
capacitors at the new higher voltage so they work for you instead of
against you.

Ok, I'll go back to lurking..

-- Daniel
  << When truth is outlawed; only outlaws will tell the truth. >> - RLiegh

On Mon, 7 Jul 2003, Michael Frank wrote:

]On Monday 07 July 2003 21:12, Ducrot Bruno wrote:
]> > The actual minimum time between steps depends on systems design and can
]> > only be established by watching the (core) voltage on an oscilloscope
]> > while modulating cpufreq/ACPI settings. The time used should be double
]> > or triple the minimum for longterm stability. It would be better if
]> > Mainboard manufacturers would specify this minimum time.
]>
]> That is suposed to be done via a BIOS table (with signature
]> AMDK7PNOW!) for the powernow-k7 driver, but is used for the
]> CPU only (I believe), and I guess that anyway this occur
]> only when a valid core voltage is applied to the CPU (well,
]> I hope).
]> But perhaps this table do not give appropriate values on some system?
]>
]> Actually, I was wondering why the _PSS method (from ACPI) give
]> a settling time of 125us, instead of 100us for some systems.
]
]100us vs 125us won't matter unless the margin is too small already.
]
]I don't know anything about the big CPU chip requirements as I have
]never read a datasheet  on on those big beasts.
]
]My comments were related to the (analog side of the) power supply
]limitations.
]
]IMHO mainboard Vcore switchers could do a step in 100us or so, or full scale
]over 10 steps or so, (weaker) main power supplies would likely have trouble
]as their switching frequency is much lower. Perhaps a mainboard designer
]could comment?
]
]Regards
]Michael
]
]
]

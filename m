From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Status of arch/arm in linux-next
Date: Tue, 26 Apr 2011 16:05:26 +0200
Message-ID: <201104261605.26791.arnd@arndb.de>
References: <20110414094447.GA1611@n2100.arm.linux.org.uk> <20110421201455.GA18083@redhat.com> <alpine.LFD.2.00.1104211629300.24613@xanadu.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.00.1104211629300.24613@xanadu.home>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Dave Jones <davej@redhat.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-arm-kernel@lists.infradead.org

On Thursday 21 April 2011, Nicolas Pitre wrote:
> > if there's commonality between some of the ARM arch drivers, why can't
> > there be a arch/arm/cpufreq/ dir for the shared code, and do everything there ?
> 
> Because usually there isn't.  "ARM" is just a CPU architecture, not a 
> system architecture.  Everything around the core is different from one 
> vendor to the next.  And when commonality exists it is much easier to 
> deal with if it is close together.

Exactly. To make matters worse, we are starting to see a number of vendors
that use multiple CPU architectures with the same I/O devices (e.g. Renesas,
Freescale, Xilinx, TI, ...). Not sure if any of these use the same cpufreq
register on more than one architecture, but it's quite likely to happen
at some point.

	Arnd

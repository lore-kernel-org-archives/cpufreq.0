From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Status of arch/arm in linux-next
Date: Tue, 19 Apr 2011 18:01:19 +0200
Message-ID: <201104191801.19348.arnd@arndb.de>
References: <20110414094447.GA1611@n2100.arm.linux.org.uk> <201104191655.13133.arnd@arndb.de> <BANLkTi=kGxL9N-RNqxmeqs4zeYo0zzfmhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=kGxL9N-RNqxmeqs4zeYo0zzfmhQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Linus Walleij <linus.walleij@linaro.org>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Tony Lindgren <tony@atomide.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

On Tuesday 19 April 2011, Linus Walleij wrote:
> I will surely put that into drivers/regulator, Mark already requested that
> as part of his review.
> 
> The problem is that it is dependent on the PRCMU driver which
> provides the communication mechanism to actually control these
> regulators.
> 
> The PRCMU is the Power Reset and Control Management Unit,
> it is a register pages where you send commands to a firmware
> running on its own CPU on the other side, partly using mailboxes.
> The firmware handles things like voltage and power domains
> (modeled as regulators), frequency changes (using CPUfreq),
> idle states (CPUidle and sleep, idling), as well as resetting
> particular memory blocks AND an I2C channel to the AB8500
> chip (driven from drivers/ab8500-core.c indeed) and some
> GPIO configuration.

Ok, thanks for the explanation.

> Thinking of it, is it OK to put chip CPUfreq drivers into
> drivers/cpufreq/* instead of into the arch/arm/* platform
> code as everyone does right now? We could probably
> fix that and bring down the diffstat considerably.

That's something to discuss with Dave Jones and other people
interested in cpufre. Right now, all cpufreq drivers, including
those for other architectures are in arch/.

I think it would be good to have the out of the individual
platforms, in particular in order to get better reviews of
new cpufreq drivers by people that are interested in them.

	Arnd

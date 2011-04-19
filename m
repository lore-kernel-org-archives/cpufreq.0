From: Dave Jones <davej@redhat.com>
Subject: Re: Status of arch/arm in linux-next
Date: Tue, 19 Apr 2011 12:27:42 -0400
Message-ID: <20110419162742.GB24372@redhat.com>
References: <20110414094447.GA1611@n2100.arm.linux.org.uk>
 <201104191655.13133.arnd@arndb.de>
 <BANLkTi=kGxL9N-RNqxmeqs4zeYo0zzfmhQ@mail.gmail.com>
 <201104191801.19348.arnd@arndb.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201104191801.19348.arnd@arndb.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Tony Lindgren <tony@atomide.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org

On Tue, Apr 19, 2011 at 06:01:19PM +0200, Arnd Bergmann wrote:
 > > Thinking of it, is it OK to put chip CPUfreq drivers into
 > > drivers/cpufreq/* instead of into the arch/arm/* platform
 > > code as everyone does right now? We could probably
 > > fix that and bring down the diffstat considerably.
 > 
 > That's something to discuss with Dave Jones and other people
 > interested in cpufre. Right now, all cpufreq drivers, including
 > those for other architectures are in arch/.
 > 
 > I think it would be good to have the out of the individual
 > platforms, in particular in order to get better reviews of
 > new cpufreq drivers by people that are interested in them.

The platform drivers are by their nature architecture specific,
so arch/ seems apropos.  drivers/platform/arm/ maybe ?

Though, having arm do something different to every other arch seems
a bit awkward too. Everyone else has their cpufreq platform driver
somewhere under arch/whatever/../cpufreq/..  so changing that
violates the principle of least surprise.

I'm also not convinced that moving them would increase review of changes.

What problem is this solving again ?

	Dave


From: Tony Lindgren <tony@atomide.com>
Subject: Re: Status of arch/arm in linux-next
Date: Fri, 22 Apr 2011 00:17:21 -0700
Message-ID: <20110422071721.GC841@atomide.com>
References: <20110414094447.GA1611@n2100.arm.linux.org.uk>
	<201104191655.13133.arnd@arndb.de>
	<BANLkTi=kGxL9N-RNqxmeqs4zeYo0zzfmhQ@mail.gmail.com>
	<201104191801.19348.arnd@arndb.de>
	<20110419160545.GJ1765@opensource.wolfsonmicro.com>
	<20110421201455.GA18083@redhat.com>
	<alpine.LFD.2.00.1104211629300.24613@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1104211629300.24613@xanadu.home>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Dave Jones <davej@redhat.com>, linux-arm-kernel@lists.infradead.org

* Nicolas Pitre <nicolas.pitre@linaro.org> [110421 13:59]:
> On Thu, 21 Apr 2011, Dave Jones wrote:
> 
> > On Tue, Apr 19, 2011 at 05:05:46PM +0100, Mark Brown wrote:
> 
> > This is why I don't believe that moving this code from arch/ to drivers/
> > will change anything.
> 
> That at least would have the property of gathering drivers together 
> according to their _purpose_, irrespective of their implementation 
> details.  That's the case for all the other class of drivers already. 
> Why would cpufreq drivers be different?

And drivers do have well defined standards, so that automatically prevents
people sneaking in spaghetti calls to platform specific code ;)

Tony

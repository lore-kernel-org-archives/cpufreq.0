From: Dave Jones <davej@redhat.com>
Subject: Re: Status of arch/arm in linux-next
Date: Fri, 29 Apr 2011 16:15:22 -0400
Message-ID: <20110429201521.GC12256@redhat.com>
References: <20110414094447.GA1611@n2100.arm.linux.org.uk>
	<alpine.LFD.2.00.1104211629300.24613@xanadu.home>
	<201104261605.26791.arnd@arndb.de> <201104261904.45923.rjw@sisk.pl>
	<20110426181508.GB1908@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110426181508.GB1908@redhat.com>
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
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, Apr 26, 2011 at 02:15:08PM -0400, Dave Jones wrote:

 >  > Indeed.  So in my opinion it makes sense to move code into the drivers
 >  > directory, at least the code that's going to be used by multiple platforms
 >  > (that need not be a complete driver).
 > 
 > Ok, so my opinion on this has changed a little over the weekend.
 > I don't totally hate it now, but I'm still not a huge fan.
 > That said, I won't stand in the way if this is what everyone agrees is
 > the way forward.
 > 
 > in cpufreq.next I moved the x86 drivers over.  Someone look it over ?
 > If that looks like what you all had in mind, start sending me the patches
 > for other arches, and I'll get them queued up for .40

FYI, this is now on the 'move-drivers' branch in cpufreq.git
Unless there's a good reason not to, I'm going to start pushing this to Linus
next merge window.

	Dave

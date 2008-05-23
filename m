From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Remove p4_clockmode driver
Date: Fri, 23 May 2008 13:40:22 -0400
Message-ID: <20080523133809.ZZRA012@mailhub.coreip.homeip.net>
References: <1209844030.13290.5.camel@linux-2bdv.site>
	<20080511161934.GI15445@codemonkey.org.uk>
	<20080522040118.GA28737@anvil.corenet.prv>
	<1211541678.29901.78.camel@queen.suse.de>
	<20080523084737.ZZRA012@mailhub.coreip.homeip.net>
	<1211555977.29901.110.camel@queen.suse.de>
	<20080523113206.ZZRA012@mailhub.coreip.homeip.net>
	<1211559367.29901.140.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1211559367.29901.140.camel@queen.suse.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Thomas Renninger <trenn@suse.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, mzahor@dtech.sk, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq <cpufreq@lists.linux.org.uk>

On Fri, May 23, 2008 at 06:16:07PM +0200, Thomas Renninger wrote:
> ...
> > > How much Watts does the machine
> > > save power when it is idle using p4-clockmod?
> > 
> > Don't care. Don't care. Do I need to repeat it? I don't care. All I
> > know is that it87 reports lower temperature when CPU is throttled.
> How much is it, constantly?
> 

Hmm, it looks ike on ide it is about 78C throttled and 81 unthrottled
(I would not pay attention to absolute numbers, I never actually tried
to calibrate the readings). So apparently not a lot... For some reason
I remember the difference a bit bigger, maybe I was lookig under light
load?

-- 
Dmitry

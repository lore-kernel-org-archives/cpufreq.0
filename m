From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Feature request
Date: Thu, 28 Aug 2003 15:50:36 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030828135036.GA17216@brodo.de>
References: <000001c3694b$6b4eb5d0$0200a8c0@informatik.domaene>
	<3F473898.4020101@gotiao.com> <3F4746DB.9080303@gotiao.com>
	<20030826231001.GB31977@brodo.de> <3F4CE772.9090605@gotiao.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F4CE772.9090605@gotiao.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viktor Radnai <efti@gotiao.com>
Cc: cpufreq@www.linux.org.uk

On Thu, Aug 28, 2003 at 03:16:34AM +1000, Viktor Radnai wrote:
> Dominik Brodowski wrote:
> >Oh well, so users want to use 150 MHz instead of 1600 MHz now...
> My laptop is still quite responsive at 150MHz and anything that lets me 
> conserve battery power when the performance isn't needed is worth 
> trying. After all, this is the very purpose of frequency scaling. It 
> doesn't really matter how fast the kernel executes idle loops ;)

Well, does your computer do some real "idling" - e.g. ACPI C-States [C2 and
above] or APM "halt"? If so, then you don't need any throttling - it saves
approximately the same amount of energy.

> >worthy of discussion for 2.7.
> That would be great, too bad that it won't happen sooner. In the 
> meantime, do you think that the method described below is an acceptable 
> way of saving power or do you foresee any potential problems / 
> instability as a result of this?
> 
> If you think that this is a workable method then I might hack one of the 
> userspace frequency scaling utilities to support this method.

As most systems support either ACPI-C-States or APM "halt" and these methods
are as "good" for power saving, I don't see a reason to implement this at
the moment.

	Dominik

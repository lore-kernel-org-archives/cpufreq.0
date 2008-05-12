From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: Re: [PATCH] Remove p4_clockmode driver
Date: Mon, 12 May 2008 19:30:48 -0300
Message-ID: <4828C518.3000705@cesarb.net>
References: <1209844030.13290.5.camel@linux-2bdv.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1209844030.13290.5.camel@linux-2bdv.site>
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
To: trenn@suse.de
Cc: cpufreq <cpufreq@lists.linux.org.uk>, mzahor@dtech.sk, Dominik Brodowski <linux@dominikbrodowski.net>, Dave Jones <davej@redhat.com>

Thomas Renninger escreveu:
> Remove p4_clockmode driver
> 
> The driver is doing throttling which is supposed to be done through another
> ACPI interface. If both interfaces are used, the machine may get very slow.
> Remove this driver which should never be used.

On the Dell Latitude D510 I use at work, acpi-cpufreq didn't load on the 
Ubuntu 7.10 kernel (2.6.22); of all the available cpufreq drivers, only 
p4-clockmod worked. I didn't try loading it on the Ubuntu 8.04 kernel 
(2.6.24) yet.

-- 
Cesar Eduardo Barros
cesarb@cesarb.net
cesar.barros@gmail.com

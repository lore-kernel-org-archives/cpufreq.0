From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: CPU Frequency daemon: no cpufreq interface found.
Date: Fri, 6 May 2005 07:41:42 +0200
Message-ID: <20050506054142.GB25388@isilmar.linta.de>
References: <200505060019.05011.fredrik.eriksson@mudsphere.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200505060019.05011.fredrik.eriksson@mudsphere.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fredrik Eriksson <fredrik.eriksson@mudsphere.net>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Fri, May 06, 2005 at 12:19:04AM +0200, Fredrik Eriksson wrote:
> having problems with my Armada M700 pIII 800mhz laptop.
> Ive tired pretty much everything... ive compiled every support for 
> speedstepping into the kernel and it still doesnt show any interfaces. 
> the sysfs doesnt show and devices in /sys/devices/system/cpu/cpu0/
> 
> and i cant see any evidence in my dmesg that CPU scaling is loaded
> 
> Anyone tried running speedstep on a Armada M700 that might be able to help?
> 
> here's a "dmesg > dmesg.txt" if that will help you find my problem
> http://www.snuttefilt.org/~sajko/dmesg.txt

Could you activate CONFIG_CPU_FREQ_DEBUG and pass "cpufreq.debug=2" to the
kernel as a boot option, please? Then post the resulting dmesg on your
homepage -- it'll contain much more useful debug info to determine the cause
of cpufreq not (yet?) running on your notebook.

	Dominik

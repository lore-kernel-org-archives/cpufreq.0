From: Alexander Bokovoy <ab@altlinux.org>
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 23:30:37 +0300
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031021203037.GB3133@sam-solutions.net>
References: <88056F38E9E48644A0F562A38C64FB60077911@scsmsx403.sc.intel.com>
	<yw1xbrsaeu44.fsf@kth.se>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <yw1xbrsaeu44.fsf@kth.se>
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
To: M?ns Rullg?rd <mru@kth.se>
Cc: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

On Tue, Oct 21, 2003 at 12:57:15PM +0200, M?ns Rullg?rd wrote:
> "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com> writes:
> 
> > Most of the latest CPUs (laptop CPUs in particular) have feature 
> > which enable very low latency P-state transitions 
> > (like Enhanced Speedstep Technology-EST). Using this feature, 
> > we can have a lightweight in kernel cpufreq governor, 
> > to vary CPU frequency depending on the CPU usage. The 
> > advantage being low power consumption and also cooler laptops.
> 
> So, I took this thing for a spin, but it didn't work at all.  I loaded
> the module, and did "echo demandbased > /sys/.../scaling_governor".
> This echo never returned, and the keyboard locked up.  After a little
> while, the fan started running at full speed.  I managed to cut and
> paste into an xterm and start top, which showed nothing unusual.  I
> could shut down and reboot normally.
I applied these patches to stock 2.6.0-test8 and selected 'demandbased' as
default governor. In result, everything worked from the very beginning, my
Centrino-based system went to 600MHz and was upping when load was going
higher during compilation or disk access but went down when load was
lowering. So it works well for me.
-- 
/ Alexander Bokovoy
Samba Team                      http://www.samba.org/
ALT Linux Team                  http://www.altlinux.org/
Midgard Project Ry              http://www.midgard-project.org/

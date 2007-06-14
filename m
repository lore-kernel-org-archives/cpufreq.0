From: Dave Jones <davej@redhat.com>
Subject: Re: Overclocking a Conroe and Using Speedstep/cpufreq.
Date: Thu, 14 Jun 2007 14:32:51 -0400
Message-ID: <20070614183251.GD1223@redhat.com>
References: <414673.66985.qm@web61217.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <414673.66985.qm@web61217.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: byteFrame <byteframe@yahoo.com>
Cc: cpufreq@lists.linux.org.uk

On Thu, Jun 14, 2007 at 10:26:01AM -0700, byteFrame wrote:
 > 
 > Word up.
 > 
 > When I dont overclock my cpu (2.4 ghz) cpufreq works
 > fine (with the ondemand governor) but when I overclock
 > the cpu to 3.0 ghz in the bios, cpu freq doesnt work.
 > They neccessary sys files arent in
 > /sys/devices/system/cpu0/ etc etc. I had orginally
 > been using the acpi cpu freq driver, but the "Enhanced
 > Speedstep" inst working either (gonna try it without
 > an option, but I doubt itll work)

Your BIOS only knows about speeds the chip is rated for.

	Dave

-- 
http://www.codemonkey.org.uk

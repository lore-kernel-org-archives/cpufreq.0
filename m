From: Dave Jones <davej@redhat.com>
Subject: Re: chipset dependant?
Date: Fri, 11 Aug 2006 19:21:48 -0400
Message-ID: <20060811232148.GA28540@redhat.com>
References: <Pine.LNX.4.64.0608111712290.15701@airraid.toptracker.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0608111712290.15701@airraid.toptracker.com>
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
To: A van Staalduijnen <cpufreq@toptracker.com>
Cc: cpufreq@lists.linux.org.uk

On Fri, Aug 11, 2006 at 05:21:14PM +0200, A van Staalduijnen wrote:
 > At home I am running an old box, running an Athlon XP on the old VIA KT133 
 > (not KT133A) chipset. Since this box is mostly idle I am considering doing 
 > the old Athlon bridge hack, to turn the cpu into an Athlon XP-M, thinking 
 > I could be using cpufreq then, in order dynamically scale frequencies.
 > 
 > I wonder though if it would suffice to turn the cpu into a 'mobile', or if 
 > it would require a different chipset on the motherboard as well (as for 
 > Intels)?
 > 
 > Any chance cpufreq will work after modding the CPU, or would it be 
 > useless?

useless.  You have no variable VRM on your motherboard, likely no BIOS tables,
and at best you'll just get a new CPU string in /proc/cpuinfo. At worst,
you'll get a dead cpu.

		Dave

-- 
http://www.codemonkey.org.uk

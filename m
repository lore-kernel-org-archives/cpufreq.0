From: Dave Jones <davej@redhat.com>
Subject: Re: Userspace: available processorspeeds
Date: Mon, 6 Oct 2003 20:59:38 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031006195938.GB1621@redhat.com>
References: <3F81339D.6010305@ITS.TUDelft.nl>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F81339D.6010305@ITS.TUDelft.nl>
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
To: Jeroen Van der Vegt <A.J.vanderVegt@its.tudelft.nl>
Cc: cpufreq@www.linux.org.uk

On Mon, Oct 06, 2003 at 11:19:25AM +0200, Jeroen Van der Vegt wrote:

 > Besides this, I have experienced the following weirdness: according to 
 > /sys/.../scaling_min_freq, my processor's minimum speed is 532 Mhz. I 
 > have, however, had it running at 292Mhz (as reported by /proc/cpuinfo). 

The 532 is a calculated speed using FSB speed * a multipler.
The 292 is an estimate based upon bogomips calculation at boot time,
and also, is subject to thermal throttling by ACPI if present.

Think of '532' as actual speed, and '292' as effective speed.

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk

From: Dave Jones <davej@redhat.com>
Subject: Re: Fw: [Bugme-new] [Bug 5435] New: Powernow code has random CPU
	speed
Date: Fri, 14 Oct 2005 01:05:44 -0400
Message-ID: <20051014050544.GA5074@redhat.com>
References: <20051013214205.200583c1.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051013214205.200583c1.akpm@osdl.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: cpufreq@www.linux.org.uk

On Thu, Oct 13, 2005 at 09:42:05PM -0700, Andrew Morton wrote:

 > powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
 > Detected 7352.734 MHz processor.
 > powernow: No PST tables match this cpuid (0x771)
 > powernow: This is indicative of a broken BIOS.
 > powernow: Trying ACPI perflib
 > powernow: Minimum speed 3342 MHz. Maximum speed 7352 MHz.

My gut feeling is that this is an ACPI regression, as the powernow-k7
driver hasn't changed dramatically recently, and in this dmesg,
we've fallen back to using the ACPI.

Something else that's really odd is that the 'Detected' line seems
to have found a 7GHz CPU, which is novel.

		Dave

From: Dave Jones <davej@redhat.com>
Subject: Re: Acer 1304xc laptop & wrong max cpu frequency
Date: Fri, 6 Aug 2004 13:59:30 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040806125930.GB26791@redhat.com>
References: <20040806053333.GA10452@kanta>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040806053333.GA10452@kanta>
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
To: Marijan Peh <marijan.peh@freenet.de>
Cc: cpufreq_mail_list <cpufreq@www.linux.org.uk>

On Fri, Aug 06, 2004 at 07:33:33AM +0200, Marijan Peh wrote:

There are two sources of tables we can look for for information
on available frequencies. When one looks broken, we fall back to
the other.

 > powernow: PowerNOW! Technology present. Can scale: frequency and
 > voltage.
 > powernow: No PST tables match this cpuid (0x780)
 > powernow: This is indicative of a broken BIOS.

Your BIOS authors can't read specifications.

 > powernow: Trying ACPI perflib
 > powernow: Minimum speed 666 MHz. Maximum speed 1266 MHz.

Thankfully, they managed to get the ACPI tables right.

Looks fine.

		Dave

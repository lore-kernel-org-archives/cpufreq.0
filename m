From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: Dothan/Centrino cpufreq
Date: Wed, 09 Jun 2004 19:09:22 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1086833362.6427.4.camel@localhost.localdomain>
References: <20040610013039.21458.qmail@web21002.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040610013039.21458.qmail@web21002.mail.yahoo.com>
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
To: athul acharya <nyte2k@yahoo.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq list <cpufreq@www.linux.org.uk>

On Wed, 2004-06-09 at 18:30 -0700, athul acharya wrote:
> Hey,
> 
> I originally sent this to linux-kernel and was advised
> that I'd be better off sending it here. 
> 
> I noticed that 2.6.7-rc1 was supposed to have Dothan
> support for cpufreq, but since neither it nor -rc2
> worked  on my machine, I decided to take a look at the
> code and see if I couldn't figure something out.  I
> saw this:
> 
> static const struct cpu_id cpu_id_dothan_a1 = {
>         .x86_vendor = X86_VENDOR_INTEL,
>         .x86 = 6,
>         .x86_model = 13,
>         .x86_mask = 1,
> };
> 
> Attempting to match this against /proc/cpuinfo, I
> changed it to
> 
> static const struct cpu_id cpu_id_dothan_a1 = {
>         .x86_vendor = X86_VENDOR_INTEL,
>         .x86 = 6,
>         .x86_model = 13,
>         .x86_mask = 6,
> };
> 
> This worked, creating
> /sys/devices/system/cpu/cpu0/cpufreq/ and the whole
> shebang.  So, the above change needs to be integrated
> in order for (some?) Dothans to work.

There seems to be a few things which need fixing in the driver, which
will require a re-org of the various tables:

1. Intel seems to have changed the branding string on Banias (but
without apparently changing the stepping)
2. There seems to be two steppings of Dothan

I'm a bit hesitant to just assume that both Dothan steppings are
identical (but since we're currently just extracting the operating
points from the BIOS, it shouldn't be a big risk).

	J

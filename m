From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: kernel: acpi-cpufreq: Transition failed
Date: Fri, 4 Feb 2005 21:27:34 +0100
Message-ID: <20050204202734.GA8030@dominikbrodowski.de>
References: <200502021158.26890.clemenso@sbox.tugraz.at>
	<200502021158.26890.clemenso@sbox.tugraz.at>
	<200502041126.58413.clemenso@sbox.tugraz.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200502021158.26890.clemenso@sbox.tugraz.at>
	<200502041126.58413.clemenso@sbox.tugraz.at>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Orthacker <clemenso@sbox.tugraz.at>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Wed, Feb 02, 2005 at 11:58:26AM +0100, Clemens Orthacker wrote:
> Since I'm using the 2.6.10 kernel

Did it work correctly when you used earlier kernels than 2.6.10? Even if
using powernowd?

> I constantly get the following error:
> kernel: acpi-cpufreq: Transition failed
> 
> Pentium4 M
> acpi-cpufreq driver (userspace governor, powernowd)
> 
> Is this a configuration problem?

If speedstep-ich works, you should use that module instead -- other than
that, this doesn't look like a configuration problem. The BIOS tells us how
the kernel should ask it for CPU frequency changes; the kernel does it, but
then the BIOS simply reports "error". It might be that the BIOS does provide
the kernel with wrong information on what the return value means -- i.e. the 
kernel thinks it is an error, but in reality it isn't.

What chipset does your notebook use (plain "lspci" output, please)?

> (btw. bogomips fails, and I have no idea why..)

I'll investigate that.

	Dominik

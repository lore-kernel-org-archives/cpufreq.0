From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: Speedstep centrino
Date: Fri, 02 Feb 2007 13:25:41 -0800
Message-ID: <45C3AC55.9010004@goop.org>
References: <736dda5d0701221243o5a096240v1142ccdf9133f1f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <736dda5d0701221243o5a096240v1142ccdf9133f1f@mail.gmail.com>
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
To: David Tunkrans <david.tunkrans@gmail.com>
Cc: cpufreq@lists.linux.org.uk

David Tunkrans wrote:
> I found your email adress in the speedstep centrino kernel source. Ive
> put down a lot of time into getting ACPI and speedstep working on my
> Mac Pro Ubuntu amd64 installation, with no success. Seems like the
> cpufreq parameters are "missing" even though the specification says
> that woodcrest Xeons do support speedstep. Also I suspect that there
> has to be specific support for Xeon processors in this driver? I would
> really appreciate if you could point me in the right direction.

In general, the newer CPUs require ACPI support to get the right
operating point parameters for the CPU; only the older Banias Pentium
M's have support built directly into the driver.  I don't know if Mac
Pros have ACPI; perhaps there needs to be some other way of getting that
info out of the BIOS, assuming its there at all.

    J

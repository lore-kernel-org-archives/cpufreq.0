From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Kernel 2.6.7 speedstep-piix4 on vaio
Date: Mon, 2 Aug 2004 22:27:29 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040802202729.GB8265@dominikbrodowski.de>
References: <43210.141.228.156.225.1091110800.squirrel@141.228.156.225>
	<20040729210413.GA7782@dominikbrodowski.de>
	<200407302020.50451.ivor@ivor.org>
	<20040802193141.GB17023@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040802193141.GB17023@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Mon, Aug 02, 2004 at 08:31:41PM +0100, Dave Jones wrote:
> On Fri, Jul 30, 2004 at 08:20:49PM +0000, Ivor Hewitt wrote:
>  > On Thursday 29 July 2004 21:04, Dominik Brodowski wrote:
>  > > On Thu, Jul 29, 2004 at 03:20:00PM +0100, Ivor Hewitt wrote:
>  > >
>  > > Therefore, the speedstep-smi driver contains a few tweaks which modify the
>  > > "language" a bit: have you tried passing the module options
>  > > "smi_port=0xb2 smi_cmd=0x82" yet? On several systems, the smi_cmd is set
>  > > wrongly by default.
>  > >
>  > Aha, with the right combination of BIOS settings and the smi_cmd=0x82 setting 
>  > the smi driver works on the Vaio Z600.
> 
> hmm, I wonder if its worth adding DMI matches for certain laptops
> that need different arguments.

I think the DMI table would get big over time... and considering Linus'
disliking of the ~10 entries in asus_hides_smbus PCI quirk, I don't know
what the general consensus on a big (~50? 100?) table is.

	Dominik

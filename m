From: paul.devriendt@amd.com
Subject: RE: Athlon 64 complains of frequency mismatch
Date: Wed, 23 Jun 2004 00:43:51 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A8432698C4@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: linux@dominikbrodowski.de, elf@buici.com
Cc: cpufreq@www.linux.org.uk

I am of the opinion that this is a bug in the ACPI subsystem.
The BIOS developers find it easy to always have the space
allocated for their tables. They "hide" them by tricks
such as changing _PSS to XPSS.

Paul.

> -----Original Message-----
> From: cpufreq-bounces@www.linux.org.uk 
> [mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of 
> Dominik Brodowski
> Sent: Tuesday, June 22, 2004 12:11 PM
> To: Marc Singer
> Cc: cpufreq@www.linux.org.uk
> Subject: Re: Athlon 64 complains of frequency mismatch
> 
> On Mon, Jun 21, 2004 at 02:42:36PM -0700, Marc Singer wrote:
> > I did fetch it.  There are no entries for _PSS or even PSS.
> 
> But an entry XPSS which contains these bogus entries...
> 
> 
>             Name (XPSS, Package (0x03)
>             {
>                 Package (0x06)
>                 {
>                     0x09999999,
>                     0x00099999,
>                     0x00999999,
>                     0x00999999,
>                     0x99999999,
>                     0x99999999
>                 },
> 
>                 Package (0x06)
>                 {
>                     0x09999999,
>                     0x00099999,
>                     0x00999999,
>                     0x00999999,
>                     0x99999999,
>                     0x99999999
>                 },
> 
>                 Package (0x06)
>                 {
>                     0x09999999,
>                     0x00099999,
>                     0x00999999,
>                     0x00999999,
>                     0x99999999,
>                     0x99999999
>                 }
>             })
> 
> 
> I'm surprised a) that the BIOS-provided tables contain such 
> obviously bogus
> data, and b) that XPSS is used by the ACPI subsystem instead 
> of reporting
> there is no _PSS.
> 
> Also, are there any entries in the BIOS you can toggle which might be
> related to "Cool&Quiet", "PnP-capable OS", ...?
> 
> 	Dominik
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
> 
> 
> 

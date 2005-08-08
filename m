From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8: missing p-state
Date: Mon, 8 Aug 2005 09:16:03 +0200
Message-ID: <20050808071603.GB852@poupinou.org>
References: <3f72be670508071713510f5697@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3f72be670508071713510f5697@mail.gmail.com>
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
To: Brendt Wohlberg <bwohlberg@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Sun, Aug 07, 2005 at 06:13:46PM -0600, Brendt Wohlberg wrote:
> I have an AMD 64 3200+ processor with 4 p-states (according to AMD
> specs), with frequencies of 1.0, 1.8, 2.0, and 2.2 GHz. On boot
> (Fedora Core 4, kernel 2.6.12), however, the powernow-k8 module only
> recognises the highest three frequencies
> 
>   powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.40.2)
>   powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x2 (1500 mV)
>   powernow-k8:    1 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
>   powernow-k8:    2 : fid 0xa (1800 MHz), vid 0xa (1300 mV)
> 
> My guess is that this problem is due to a buggy BIOS. Are there any existing 
> solutions to this problem? Given the apparent number of AMD 64 motherboards 
> with similar problems, surely it would be useful to be able to specify
> the p-state
> table as a configuration option for the powernow-k8 module?

I'm unaware of this problem I'm afraid.

Hi,

Is this with or without ACPI?

Could you send me the output of acpidmp, please ?

wget ftp://ftp.kernel.org//pub/linux/kernel/people/lenb/acpi/utils/pmtools-20031210.tar.bz2
tar xjvfp pmtools-20031210.tar.bz2
cd pmtools-20031210/acpidmp
make
sudo ./acpidmp > acpidmp.out
bzip2 acpidmp.out 

Then mail privately to me the acpidmp.out.bz2

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

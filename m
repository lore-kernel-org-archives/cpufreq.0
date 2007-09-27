From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Intel Core2Quad Q6600 2,4 GHz Socket775 FSB1066
Date: Thu, 27 Sep 2007 14:48:31 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F501715910@scsmsx415.amr.corp.intel.com>
References: <200709272259.18445.ederstefan@gmx.de><46FC1E3E.6070200@redhat.com>
	<200709272333.14046.ederstefan@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <200709272333.14046.ederstefan@gmx.de>
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
To: Stefan Eder <ederstefan@gmx.de>, cpufreq@lists.linux.org.uk

 

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk 
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Stefan Eder
>Sent: Thursday, September 27, 2007 2:33 PM
>To: cpufreq@lists.linux.org.uk
>Subject: Re: Intel Core2Quad Q6600 2,4 GHz Socket775 FSB1066
>
>Am Donnerstag, 27. September 2007 23:18:54 schrieb Jarod Wilson:
>> Stefan Eder wrote:
>> > Hallo everyone,
>> > ist there a chance for powersaving with the following CPU?
>>
>> Yes.
>>
>> > And if so, what are
>> > the related modules to load?
>>
>> acpi-cpufreq for freq scaling support, cpufreq-ondemand for your
>> governor (may be built-in though)
>
>Hallo, tried this module on openSUSE 10.3 RC1:
>
>modprobe acpi-cpufreq
>FATAL: Error inserting acpi_cpufreq 
>(/lib/modules/2.6.22.5-29-bigsmp/kernel/arch/i386/kernel/cpu/cp
>ufreq/acpi-cpufreq.ko): 
>No such device
>

Depends on whether your BIOS is enabling this feature. Check in BIOS
options for any switch related to this feature. Also make sure you have
the latest BIOS for the platform.

Thanks,
Venki

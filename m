From: Damien Marchal <marchal@lifl.fr>
Subject: Re: my dothan didn't work with cpufreq...
Date: Wed, 14 Jul 2004 12:50:09 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40F50FE1.10405@lifl.fr>
References: <40F2FA8B.10307@lifl.fr>
	<20040713094937.GB8124@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040713094937.GB8124@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi,

i check my .config and saw that the X86_SPEEDSTEP_CENTRINO_TABLE was 
always set to Y and it can be changed by make menuconfig.

By manually editing it to N give me a fully functional cpufreq module.

Thank for your help.

I quickly add an entry for this value in cpufreq/Kconfig:
----------------------------------------------------------------------------------------------------------------
config X86_SPEEDSTEP_CENTRINO_TABLE
        bool "Use predefined frequency/voltage pairs (Banias only)"
        depends on X86_SPEEDSTEP_CENTRINO
        default y
        help
                This only work for Banias processor. Dothan users must
                set this to N.

-------------------------------------------------------------------------------------

Cheers,
Damien.
Dominik Brodowski wrote:

>Hi,
>
>On Mon, Jul 12, 2004 at 10:54:35PM +0200, Damien Marchal wrote:
>  
>
>>speedstep-centrino: found unsupported CPU with Enhanced SpeedStep: send 
>>/proc/cpuinfo to Jeremy Fitzhardinge <jeremy@goop.org>
>>
>>What I did. As i received no feedback I look inside the cpufreq 
>>sourcecode that throw the error and I tried to fixed it myself. I 
>>compared it with the content of my /proc/cpuinfo:
>>
>>cpu family      : 6
>>model             : 13
>>model name   : Intel(R) Pentium(R) M processor 1.50GHz
>>stepping        : 6
>>cpu MHz         : 1500.834
>>cache size      : 64 KB
>>
>>I located a correct cpu_id cpu_id_dothan_b0 but I wasn't able to locate 
>>were is it used (it  seems to differ from the banias  code).
>>    
>>
>
>Dothan's only work if X86_SPEEDSTEP_CENTRINO_ACPI is enabled in your kernel
>configuartion. Did you enable it? You need to set ACPI_PROCESSOR to "y" if
>you want to use it with SPEEDSTEP_CENTRINO="y", or ACPI_PROCESSOR="y" or
>ACPI_PROCESSOR="m" if you use it with SPEEDSTEP_CENTRINO="m".
>
>  
>
>>In addition in the centrino_cpu_init_table(struct cpufreq_policy 
>>*policy), the loop that detect the processor failed as my processor 
>>string contains 1.50Ghz and not 1500Mhz (maybe an issue related to my 
>>Asus BIOS).
>>    
>>
>
>No, that changed from Banias to Dothan CPUs in general. However, the "table"
>method isn't available for Dothans.
>
>  
>
>>In fact, I could try to make a patch for making my processor accepted by 
>>the centrino checking code, but after this I ignore what will happend as 
>>no predefined tables frequency/voltage exists like with the Banias. Will 
>>it burn my computer :)
>>    
>>
>
>Maybe. The frequency/voltage pairs for Dothans are different to those of
>Banias. A built-in table isn't possible for Dothans, IIRC, as even if you 
>know the CPUID you can't know for 100% which pairs are valid -- it depends
>on some other info not in the CPUID.
>
>If SPEEDSTEP_CENTRINO doesn't work, you can also try out the ACPI P-States
>cpufreq driver -- it tends to work on most Centrino (Banias or Dothan)
>notebooks, offers the same frequency / voltage scalings but a slower
>frequency & voltage scaling path (i.e. transitions take ~100us compared to
>~10us, IIRC).
>
>	Dominik
>  
>

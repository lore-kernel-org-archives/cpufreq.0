From: Toula Michael <keos@wanadoo.fr>
Subject: Re: STPGNT with athlonXP PowerNow
Date: Wed, 03 Sep 2003 16:47:17 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F55FEF5.7070207@wanadoo.fr>
References: <3F55F3CD.30207@wanadoo.fr> <20030903141259.GD4401@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030903141259.GD4401@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Ducrot Bruno wrote:

>On Wed, Sep 03, 2003 at 03:59:41PM +0200, Toula Michael wrote:
>  
>
>>Hi,
>>I've just read an interesting HOWTO called Athlon-Powersaving-HOWTO 
>>(http://www.daniel.nofftz.net/linux/Athlon-Powersaving-HOWTO.html) 
>>...and also a more theoretical article here 
>>http://vcool.occludo.net/VC_Theory.html
>>And I was wondering if setting the ?Disconnect eable when STPGNT 
>>detected? bit in the north bridge of the chipset is useful with an 
>>Athlon-XP power now (the mobile version)
>>Maybe this the bit is already set or not available ? It may not have any 
>>effect?
>>    
>>
>
>It is usefull, but not for powernow stuff.  AFAIK you need at least
>acpi and check that you have something like that:
>
>ducrot@poupon:~$ cat /proc/acpi/processor/CPU0/power 
>active state:            C2
>default state:           C1
>bus master activity:     00000000
>states:
>    C1:                  promotion[C2] demotion[--] latency[000] usage[00001220]
>   *C2:                  promotion[--] demotion[C1] latency[090] usage[00006826]
>    C3:                  <not supported>
>
>If you dont have C2 then you may have to complain to the manufacturer, and
>hack a little the DSDT.
>
C2 state works fine for me

>If you don't see any kind of more power saving (fan always on, shutdown due
>to overheat situation, etc.) then complain to acpi developpers,
>
Acpi works fine, lucky ACPI developpers ;)

> and use the
>Athlon-Powersaving-HOWTO in the mean time in order to set the bit you
>mention.
>
Ok so this trick is not useful for freqency scalling (cpufreq does), but 
I can save power when my processor is idle ?

>
>Cheers,
>
THX again,

>
>  
>

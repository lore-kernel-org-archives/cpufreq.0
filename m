From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: STPGNT with athlonXP PowerNow
Date: Wed, 3 Sep 2003 16:12:59 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030903141259.GD4401@poupinou.org>
References: <3F55F3CD.30207@wanadoo.fr>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F55F3CD.30207@wanadoo.fr>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Toula Michael <keos@wanadoo.fr>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 03, 2003 at 03:59:41PM +0200, Toula Michael wrote:
> Hi,
> I've just read an interesting HOWTO called Athlon-Powersaving-HOWTO 
> (http://www.daniel.nofftz.net/linux/Athlon-Powersaving-HOWTO.html) 
> ...and also a more theoretical article here 
> http://vcool.occludo.net/VC_Theory.html
> And I was wondering if setting the ?Disconnect eable when STPGNT 
> detected? bit in the north bridge of the chipset is useful with an 
> Athlon-XP power now (the mobile version)
> Maybe this the bit is already set or not available ? It may not have any 
> effect?

It is usefull, but not for powernow stuff.  AFAIK you need at least
acpi and check that you have something like that:

ducrot@poupon:~$ cat /proc/acpi/processor/CPU0/power 
active state:            C2
default state:           C1
bus master activity:     00000000
states:
    C1:                  promotion[C2] demotion[--] latency[000] usage[00001220]
   *C2:                  promotion[--] demotion[C1] latency[090] usage[00006826]
    C3:                  <not supported>

If you dont have C2 then you may have to complain to the manufacturer, and
hack a little the DSDT.
If you don't see any kind of more power saving (fan always on, shutdown due
to overheat situation, etc.) then complain to acpi developpers, and use the
Athlon-Powersaving-HOWTO in the mean time in order to set the bit you
mention.

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

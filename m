From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Pentium III Coppermine
Date: Fri, 15 Oct 2004 14:26:06 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041015122606.GA22405@poupinou.org>
References: <33222.14179-2631-1010294146-1097668908@email.seznam.cz>
	<1097816814.2125.8.camel@duvel.paparoot.org>
	<200410151016.26335.hladky.jiri@seznam.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200410151016.26335.hladky.jiri@seznam.cz>
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
To: Jiri Hladky <hladky.jiri@seznam.cz>
Cc: ":: paparoot ::" <paparoot@paparoot.org>, cpufreq@www.linux.org.uk

Hi,

On Fri, Oct 15, 2004 at 10:16:25AM +0200, Jiri Hladky wrote:
> Hi paparoot,
> 
> great! I was not able to find any relevant information about Linux on T22. So 
> let me use your offer:-)
> 
> Is speedstep working on your T22? I have installed SUSE 9.1, but I'm not able 
> to get  speedstep working. 
> 
> modprobe -v speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1
> 
> does not report any errors, but has also no effect:-(
> 
> What did you do to get it working?

Have you recompiled your kernel the way Dominik said you?

BTW, speedstep-detect report that:

BIOS support GSIC call:
        signature: GSIC
        command port = 0x00b2
        command =      0x0082
        event port =   0x00c000b3
        flags =        0x07d00000

so that you have only to modprobe speedstep-smi without any parameters.

Finally there were people reporting that the old speedstep-piix4
driver worked, though this driver is not so more supported so I guess
people using this one do not need it now, or they have not upgraded
their kernel maybe.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

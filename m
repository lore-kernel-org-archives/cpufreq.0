From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: CPU Frequency daemon: no cpufreq interface found.
Date: Fri, 6 May 2005 10:09:44 +0200
Message-ID: <20050506080944.GA21800@poupinou.org>
References: <200505060019.05011.fredrik.eriksson@mudsphere.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200505060019.05011.fredrik.eriksson@mudsphere.net>
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
To: Fredrik Eriksson <fredrik.eriksson@mudsphere.net>
Cc: cpufreq@lists.linux.org.uk

On Fri, May 06, 2005 at 12:19:04AM +0200, Fredrik Eriksson wrote:
> having problems with my Armada M700 pIII 800mhz laptop.
> Ive tired pretty much everything... ive compiled every support for 
> speedstepping into the kernel and it still doesnt show any interfaces. 
> the sysfs doesnt show and devices in /sys/devices/system/cpu/cpu0/
> 
> and i cant see any evidence in my dmesg that CPU scaling is loaded
> 
> Anyone tried running speedstep on a Armada M700 that might be able to help?
> 
> here's a "dmesg > dmesg.txt" if that will help you find my problem
> http://www.snuttefilt.org/~sajko/dmesg.txt
> 

Could you try to build speedstep-smi as a module and do something like
this:

modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1

Please do it with debug things as pointed by Dominik.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

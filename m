From: Todd Poynor <tpoynor@mvista.com>
Subject: Re: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to
 ACPI	P-state driver
Date: Thu, 23 Oct 2003 11:16:48 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F981B10.3070900@mvista.com>
References: <88056F38E9E48644A0F562A38C64FB6007793C@scsmsx403.sc.intel.com>
	<1066897184.395.1.camel@laptop.fenrus.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090405070502060008070407"
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <1066897184.395.1.camel@laptop.fenrus.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: arjanv@redhat.com
Cc: linux-acpilinux-acpi@intel.com, cpufreq@www.linux.org.uk, "Pallipadi,
	Venkatesh" <venkatesh.pallipadi@intel.com>


This is a multi-part message in MIME format.
--------------090405070502060008070407
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

On Wed, 2003-10-22 at 20:21, Pallipadi, Venkatesh wrote:

>And with the kind of power savings that comes with these frequency
>changes, this behaviour 
>results in  longer battery life. However, as yet I do not have any
>numbers to quantify this gain, 
>mainly because I do not have any setup where I can measure actual power.

I measured amps consumed by a 1.4GHz Centrino notebook model running a 
similar power management system called Dynamic Power Management 
http://dynamicpower.sourceforge.net, which leverages code from the 
speedstep-centrino cpufreq driver by Jeremy Fitzhardinge.  DPM is set to 
run the system at full power when running a process and at minimal power 
when idle (using scheduler hooks).  These numbers, which are attached, 
would probably roughly correspond to a cpufreq-based setup on the same 
platform that modified the CPU speed and voltage very quickly in 
response to process scheduling activity.  I may perform some analysis of 
more dynamic applications that more evenly divide their time between 
active and idle in the near future, in case there is any interest in this.

Amps consumed should be a good predictor of expected battery life, 
independent of the vagaries of any particular battery.  The expensive 
scopemeter used for the attached measurements isn't really necessary, by 
the way; a $130 multimeter that averages DC amps, placed in series 
between the DC transformer and the notebook, should do fine.  In case 
this helps,

-- 
Todd

--------------090405070502060008070407
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------090405070502060008070407--



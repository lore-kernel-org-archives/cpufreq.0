From: Tom Bruno <crweb@vwords.com>
Subject: Re: cpu won't stay in powersave mode
Date: Mon, 15 Dec 2003 15:18:04 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1071501484.21334.1.camel@localhost>
Reply-To: crweb@vwords.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

Sorry, accendtly hit reply instead of send to list.

On Mon, 2003-12-15 at 14:14, Thomas Renninger wrote:
> Tom Bruno wrote:
> 
> >Like i said above if I change it via hand using echo, /proc/cpuinfo
is
> >correct, and the cputest reports the correct speed constantly.
> >
> >performance mode: 2.4ghz
> >powersave mode: 1.2ghz
> >Intel P4-M 2.4ghz
> >Dell Inspiron 8500 - Bios A05
> >kernel-2.6.0-test11
> >  
> >
> /proc/cpu_info didn't work for me, too.
> However it seems to work now(after I changed the governors to be 
> compiled as modules(or the way around?)).
> 
I've now tried both as modules, and compiled in, /proc/cpuinfo works
niether report correctly.

> If you want to detemine the current real speed of your machine use the
> procspeed prog I posted some days ago(04.12, 09.12).

yes, that is the program i spoke of.  However, like i said, when
/proc/cpuinfo is reporting wrong, my system works it's way back to full
speed even though powersave is in the /sys scaling_governor.

It will report the changed speed (clockdown to 1.2ghz) for about 10
seconds, and then will start to report again at 2.4ghz even though the
setting haddn't changed.

-- 
Vwords.com Technology Services
 PC and Network Services for Southern Illinois
  Phone: 618-713-6896
-- 
Vwords.com Technology Services
 PC and Network Services for Southern Illinois
  Phone: 618-713-6896

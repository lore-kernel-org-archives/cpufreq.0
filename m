From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Pentium-M (Centrino): no power saved?
Date: Fri, 19 Sep 2003 13:46:36 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030919114636.GT11391@poupinou.org>
References: <m24qz9r0ko.fsf@tnuctip.rychter.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <m24qz9r0ko.fsf@tnuctip.rychter.com>
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
To: Jan Rychter <jan@rychter.com>
Cc: cpufreq@www.linux.org.uk

On Thu, Sep 18, 2003 at 07:09:27PM -0700, Jan Rychter wrote:
> Hmm. I'm puzzled. I've just done a checkout of the latest CVS version of
> cpufreq for 2.4, applied it to a 2.4.22 kernel and tried the thing out
> on a Toshiba SS7/290LNKW laptop.
> 
> The speedstep-centrino module loads happily and tells me I have a 900MHz
> Pentium-M. (this is a family 6 model 9 stepping 5 CPU).
> 
> I've tried echo "0%100%powersave" > /proc/cpufreq 
>   and 
>  echo "0%50%powersave" > /proc/cpufreq
> 
> and much to my surprise, even though /proc/cpufreq echoes my changes, I
> can see no resulting changes in power consumption as reported by ACPI
> battery proc entry.
> 
> Other things make a difference: whether the system is able to use C3,
> display brightness, wireless card, etc. But changing the cpufreq entry
> doesn't seem to do anything.
> 

The two use a different API for their stuff.  You just have to
chose cpufreq (of course!) or ACPI performance states.  Not the 2 at
the same time.

Next, doing
echo "0%100%powersave" > /proc/cpufreq
echo "0%50%powersave" > /proc/cpufreq

powersave governor will chose the lowest frequency available for your
cpu (in the limit you specified).  In both case, you have chosen
the lowest frequency.

Please note also that if really you use the ACPI perf, and you have
a thermal zone with passive cooling, then the performance stuff (from
the thermal zone) may confuse cpufreq.

*BLINK* This is not the case for 2.6, which is well designed in
that regard *BLINK*

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

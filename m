From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: speedstep won't load even with acpi tables (lil more)
Date: Tue, 05 Oct 2004 14:23:51 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1097011431.11915.7.camel@localhost>
References: <4162FBD9.5010806@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <4162FBD9.5010806@comcast.net>
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
To: "W. Brown" <wbrownab@comcast.net>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Tue, 2004-10-05 at 15:54 -0400, W. Brown wrote:
> Hay, sorry I'm very new to Linux. I don't know much about kernel module 
> debugging. However I was able to find the load is crapping out in the 
> call to cpufreq_register_driver by adding some printk's :). In that 
> function... its returning -EBUSY at ...
>     if (cpufreq_driver) {
>         spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
>         return -EBUSY;
>     }
> 
> An uneducated guess tells me something is already accessing the 
> neccessary resource?

Do you have some other cpufreq drivers configured?

	J

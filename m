From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Thu, 03 Aug 2006 16:01:23 -0700
Message-ID: <44D28043.5010301@goop.org>
References: <8be731880608030605x6dbeb691kc7079a9d51fe87e9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <8be731880608030605x6dbeb691kc7079a9d51fe87e9@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: tobias.bocanegra@day.com
Cc: cpufreq@lists.linux.org.uk, acpi-devel@kernel.org

Tobias Bocanegra wrote:
> hi,
> i don't know if this is the correct list to ask this question, if not
> just bash me :-)
>
> i have a intel dual core t2600 with 2.16ghz, running 2.6.17-1.2157_FC5smp
I've seen similar stuff on my T2400, expecially after resume.  Check the 
scaling_min/max_freq entries; I find that the cur is limited by their 
contents.

I did a bit of debugging, and found the problem was that the acpi 
functions on the policy change notifier change were vetoing the change, 
because they though the max freq is 1GHz, rather than 1.83.

Unfortunately I don't have any of the logs at the moment; I was going to 
do a more systematic examination of what's going on.  But from a first 
cut, it seems that something in ACPI is getting a more or less random 
idea of what the current CPU max speed is.

BTW, this is a Thinkpad X60 with the most current BIOS installed (1.06?).

    J

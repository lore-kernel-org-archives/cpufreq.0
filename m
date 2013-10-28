From: David C Niemi <dniemi@verisign.com>
Subject: Re: Questions about Runtime PM
Date: Mon, 28 Oct 2013 16:19:39 -0400
Message-ID: <526EC6DB.2060303@verisign.com>
References: <Pine.LNX.4.44L0.1310281512460.1246-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1310281512460.1246-100000@iolanthe.rowland.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Luis Alfonso Maeda-Nunez <lm15g10@ecs.soton.ac.uk>, cpufreq@vger.kernel.org, rjw@sisk.pl

On 10/28/13 15:16, Alan Stern wrote:
> On Mon, 28 Oct 2013, Luis Alfonso Maeda-Nunez wrote:
...
> Reading through the documentation of Runtime PM it 
> sends the processor (or any device) to sleep after a period of idleness. 
> In my system, however, as I am running a benchmark (fft from MiBench) in 
> a loop, suddenly the processor is sent to a low power mode (without 
> being idle). I looked at the traces (attached to this email) and it just 
> goes to C1 (I believe it's for ACPI).
> I don't understand how a CPU can go into a low-power mode like C1 
> without being idle.  By definition, when the CPU isn't in C0, it isn't 
> doing any work.
Depends on how you define "CPU" and "idle".

A busy CPU will have a number of cores idle at least for short periods of time while others are busy.

And a busy core typically spend time in C1 while it waits for I/O (unless it is 100% compute-bound for the long haul and there is zero I/O going on, which is kind of unusual).

I expect fft to be pretty compute-bound, but it's hard to keep all cores 100% busy 100% of the time for long.  Or there may just be a bad idle config.  Is this with intel-idle or acpi-idle?

Also, normally a core hops between C0 and C1 extremely rapidly.  It is more meaningful to talk about what percentage of time it spends in each, it is almost impossible to stay in either one continuously.

DCN


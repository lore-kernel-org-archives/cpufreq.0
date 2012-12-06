From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 08:49:23 -0800
Message-ID: <50C0CC93.6020709@linux.intel.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com> <50C0C950.2070007@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50C0C950.2070007@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: David C Niemi <dniemi@verisign.com>, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com

On 12/6/2012 8:35 AM, Dirk Brandewie wrote:

>
>  > would be nice if the new driver can be compatible with the existing
>  > governor by exposing an ability to set and report current frequencies.
>  > But if this is impractical or pointless for Sandy Bridge, so be it.
>
> I agree that reporting the current frequency is important to some
> utilities.


this is a problem btw, for two reasons
1) the answer you get from the sysfs file is only valid for a very very short time (10 msec at most)
2) the answer you get from the sysfs file is a lie... so it's not really valid for even 0.01 msec.

Even today, the frequency that is reported is largely fictional, and typically not
the frequency of what the core/cpu is actually running it.
10 years ago we could report something reasonable.
Hardware just doesn't work that way anymore nowadays...
We can report what you ran at (past tense), that is something Intel and AMD hardware exposes.
(and if you run powertop, it'll report this as well)
But to know what you are currently running at? No chance in hell ;-(





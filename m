From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 14:08:31 -0800
Message-ID: <50C1175F.7040602@linux.intel.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50C10AE1.4060608@linux.intel.com> <1912941.ZSxpVlGcnU@vostro.rjw.lan> <1848925.yZaqRNHFOk@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1848925.yZaqRNHFOk@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: David C Niemi <dniemi@verisign.com>, dirk.brandewie@gmail.com, cpufreq@vger.kernel.org, deneen.t.dock@intel.com

On 12/6/2012 1:34 PM, Rafael J. Wysocki wrote:
>>>>>
>>>>> * Uncompromised performance
>>>>> * Balanced - biased towards performance     (say, defined to be lowest power at most a 2 1/2% perf hit)
>>>>> * Balanced                                  (say, at most a 5% perf hit)
>>>>> * Balanced - biased towards lower power     (sat, at most a 10% perf hit)
>>>>> * Uncompromised lowest power


> That said starting with a small value and going up exponentially, like
> (1->)2->4->8->16->32->64, sounds like a good idea.


... like 2 1/2, 5 and 10 ? ;-)



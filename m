From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][DOCUMENTATION BUGFIX] latency in micro-, not nanoseconds
Date: Mon, 10 Nov 2003 21:16:54 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031110211654.GA10144@redhat.com>
References: <20031104160816.GA9187@brodo.de>
	<20031110163209.GP10144@redhat.com>
	<20031104160816.GA9187@brodo.de>
	<20031110163209.GP10144@redhat.com>
	<20031110171533.GS21970@poupinou.org>
	<20031104160816.GA9187@brodo.de>
	<20031110163209.GP10144@redhat.com>
	<20031110171533.GS21970@poupinou.org>
	<20031110172246.GT10144@redhat.com>
	<20031110205029.GA7149@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031110205029.GA7149@brodo.de>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

On Mon, Nov 10, 2003 at 09:50:29PM +0100, Dominik Brodowski wrote:

 > > Actually, I'm wondering why we need this at all anyway..
 > 
 > To determine the "cost" of frequency and/or voltage transitions when doing
 > dynamic switching. If the system is unresponsive for too long a period of 
 > time, dynamic switching doesn't make sense [at least when some sort of
 > real-time or "responsiveness" is needed]. Also, the time to needed switch 
 > back to 100% of processing power should be added to the "overhead" idleness
 > on future load calculations of yet-to-be-written load-predicting cpufreq
 > governors.

Ok, I can buy that. But it's not being used at all right now, right ?

		Dave

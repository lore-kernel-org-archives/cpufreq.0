From: Juliusz Chroboczek <jch@pps.jussieu.fr>
Subject: Re: Cpufreq: powernow-k7 weirdness
Date: 07 Jul 2003 14:58:37 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <tpfzlih4si.fsf@helium.pps.jussieu.fr>
References: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr>
	<20030706012114.GW7796@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030706012114.GW7796@poupinou.org>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk, davej@suse.de

>> Running stock 2.5.73 (ACPI + preempt) on a Compaq Presario 711, CPU is
>> a 950MHz mobile Duron.  I'm getting unexpected timings when enabling
>> cpufreq.

> There is a little bug in powernow-k7.c

> ducrot@neptune $  cvs diff -u -r1.42 powernow-k7.c

Yep, that did it.  Thanks a lot.

Why don't you push it into 2.5?

                                        Juliusz

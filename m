From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Cpufreq: powernow-k7 weirdness
Date: Mon, 7 Jul 2003 15:12:52 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030707131252.GC7796@poupinou.org>
References: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr> <20030706184801.GY7796@poupinou.org> <200307062356.01561.lbelli@crema.unimi.it> <200307071129.46683.mflt1@micrologica.com.hk>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200307071129.46683.mflt1@micrologica.com.hk>
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
To: Michael Frank <mflt1@micrologica.com.hk>
Cc: Luigi Belli <lbelli@crema.unimi.it>, cpufreq@www.linux.org.uk

> The actual minimum time between steps depends on systems design and can 
> only be established by watching the (core) voltage on an oscilloscope 
> while modulating cpufreq/ACPI settings. The time used should be double 
> or triple the minimum for longterm stability. It would be better if 
> Mainboard manufacturers would specify this minimum time.

That is suposed to be done via a BIOS table (with signature
AMDK7PNOW!) for the powernow-k7 driver, but is used for the
CPU only (I believe), and I guess that anyway this occur
only when a valid core voltage is applied to the CPU (well,
I hope).
But perhaps this table do not give appropriate values on some system?

Actually, I was wondering why the _PSS method (from ACPI) give
a settling time of 125us, instead of 100us for some systems.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

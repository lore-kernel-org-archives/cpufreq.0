From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH 2.6] sysfs stuff in order to override a powernow-k7 table
Date: Tue, 3 Feb 2004 19:47:18 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040203184718.GA3495@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk
Cc: Dave Jones <davej@redhat.com>, Dominik Brodowski <linux@dominikbrodowski.de>

Hi list,

This is some patches to be able to override a
buggy powernow table for the k7.

All patches for this purpose are at:
http://www.poupinou.org/cpufreq/powernow-k7/


BIG FAT DISCLAIMER:
READ CARREFULLY README.txt AVAILABLE AT
http://www.poupinou.org/cpufreq/powernow-k7/README.txt
BEFORE USING IT.

* 01_powernow_dummy_table.diff

Allow the possibility to have powernow-k7 being loaded, even though
PST is broken.  There is a need, though, to be DMI blacklisted.

* 02_powernow_more_attributes.diff

Some attributes that permit to look into powernow-k7 internals.

* 10_powernow_overwrite_table.diff

That the main stuff.  It introduce the possibility to touch
the internals of the powernow-k7 in order to change things.

Note that it is only usefull for well known broken laptop.

An alternative for this is to wait an upcoming patch in order to
retrieve the configuration via ACPI.


* 0000_powernow_overwrite_table.ALL.diff
The whole (minus README.txt) in one diff.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

From: Matthew Harrell <mharrell-dated-1105374160.f5a808@bittwiddlers.com>
Subject: Re: found unsupported CPU with Enhanced SpeedStep
Date: Wed, 5 Jan 2005 11:22:34 -0500
Message-ID: <20050105162234.GA18703@bittwiddlers.com>
References: <20041230014005.GA16358@bittwiddlers.com>
	<1104446294.24179.1.camel@localhost>
	<20050102120729.GB23300@dominikbrodowski.de>
	<20050105160622.GE19199@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050105160622.GE19199@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

: 
: Could you please send me those files as well?
: I would like much the full acpi dump, since it may be in a SSDT table
: instead.
: 

Dominik was pretty helpful.  It looks like the _PSD entries are missing from
the SSDT table.  Many of my errors (and bootup instability) seem to go away
when I don't run with hyperthreading on.  The processor does seem to scale 
down the cpu speed but it just doesn't appear to like the interaction between
hpyerthreading and speedstep

Here are a bunch of the files I made available to him

  http://alecto.bittwiddlers.com/files/inspiron-5160/dmesg
  http://alecto.bittwiddlers.com/files/inspiron-5160/dmesg-noht
  http://alecto.bittwiddlers.com/files/inspiron-5160/dsdt.dat
  http://alecto.bittwiddlers.com/files/inspiron-5160/dsdt.dsl
  http://alecto.bittwiddlers.com/files/inspiron-5160/ssdt.dat
  http://alecto.bittwiddlers.com/files/inspiron-5160/ssdt.dsl

Does this contain the ACPI dump you were looking for?

-- 
  Matthew Harrell                          Another Month's End:
  Bit Twiddlers, Inc.                      All Targets Met 
  mharrell@bittwiddlers.com                All Systems Working
                                           All Customers Satisfied
                                           All Staff Enthusiastic
                                           All Pigs Fed And Ready To Fly

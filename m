From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Acer Aspire 1300 buggy BIOS - hardcoded patch
Date: Fri, 4 Jul 2003 19:04:56 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030704170456.GE7796@poupinou.org>
References: <200306301436.29188.lbelli@crema.unimi.it> <20030630151401.GE7796@poupinou.org> <20030701105154.GK7796@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030701105154.GK7796@poupinou.org>
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
To: cpufreq@www.linux.org.uk
Cc: Luigi Belli <lbelli@crema.unimi.it>

> Interresting.  From ACPI point-of-view, you have those states (I reproduce
> only the different frequencies)
> 
> 950 MHz
> 750 MHz
> 700 MHz
> 600 MHz
> 500 MHz
> 
> Ahem,  seems that not only your PST table is somehow wrong, but it seems
> there is nothing to do with ACPI either, sorry.
> 

Ok.  Looking a little bit more, I think I can in fact retrieve
the exact same configuration (at least FID/VID), minus fsb and
settling time (which is 125us instead of 100us) than your override.

I am therefore wondering if that is OK to fallback to retrieve at
least those FID/VID via ACPI, but (ahem) still the fsb issue though.


The 5 states retrieved via _PSS look like this:

+---------+-------------------+---------------+------------+--------+
|  Freq.  | Power compsuption | settling time |   control  | verif. |
|---------+-------------------+---------------+------------+--------|
| 950 MHz |     24000 mW      |     125 us    | 0x009C418D | 0x018D |
| 750 MHz |     16337 mW      |     125 us    | 0x009C41C9 | 0x01C9 |
| 700 MHz |     15248 mW      |     125 us    | 0x009C41C8 | 0x01C8 |
| 600 MHz |     12084 mW      |     125 us    | 0x009C4226 | 0x0226 |
| 500 MHz |      9280 mW      |     125 us    | 0x009C4264 | 0x0264 |
+---------+-------------------+---------------+------------+--------+

Therefore, the 'control' stuff look like:
bits 0-4: FID
bits 5-9: VID
other bits: ?

rem: I must admit I don't know for what is the other bit-fields.
     Perhaps some may give real fsb and settling time?

which then permit to get those pairs (FID/VID):

state 0:  FID:0x0d (1263.5 MHz -- 950.0 MHz) / VID:0x0c (1.400)
state 1:  FID:0x09 (997.5 MHz -- 750.0 MHz) / VID:0x0e (1.300)
state 2:  FID:0x08 (931.0 MHz -- 700.0 MHz) / VID:0x0e (1.300)
state 3:  FID:0x06 (798.0 MHz -- 600.0 MHz) / VID:0x11 (1.250)
state 4:  FID:0x04 (665.0 MHz -- 500.0 MHz) / VID:0x13 (1.200)

rem: For the FID, I compute also the theorical freq. if fsb = 133 at
     first, then if fsb = 100.
and well, that look a little better than nothing.

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Acer Aspire 1300 buggy BIOS - hardcoded patch
Date: Mon, 30 Jun 2003 17:14:01 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030630151401.GE7796@poupinou.org>
References: <200306301436.29188.lbelli@crema.unimi.it>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200306301436.29188.lbelli@crema.unimi.it>
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
To: Luigi Belli <lbelli@crema.unimi.it>
Cc: cpufreq@www.linux.org.uk

On Mon, Jun 30, 2003 at 02:36:29PM +0200, Luigi Belli wrote:
> I'm one of the owners of an Acer Aspire 1300 series with a buggy BIOS, so I 
> decided to hardcode a patch with the correct PST table for my mobile Athlon 
> XP 1800+.
> I know very little of kernel internals, I only opened powernow-k7.c and tried 
> to guess what had to be changed...
> For me it works and I decided to post it here for those in my conditions 
> waiting for a new bios or a newer cpufreq release.
> It's a patch against kernel 2.4.21-ac4.


I am wondering if the _PCT table (from ACPI) are correct or not.
Could you send me a DSDT table, please?  For this, you have to
retrieve pmtools from intel site (this should be the latest link):

http://developer.intel.com/technology/iapc/acpi/downloads.htm


then go to pmtools-20010730/acpidmp/
make
./acpidmp DSDT > dsdt
gzip dsdt

then send me *privately* the dsdt.gz file.

I will then look if, at least, ACER guy give correct _PCT table.

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

From: Dave Jones <davej@redhat.com>
Subject: Re: Cpufreq and AMD mobile Athlon 4
Date: Tue, 2 Sep 2003 13:59:08 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902125908.GB1225@redhat.com>
References: <1062500550.5141.3.camel@riogrande>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1062500550.5141.3.camel@riogrande>
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
To: Matt Wright <matt@consultmatt.co.uk>
Cc: cpufreq@www.linux.org.uk

On Tue, Sep 02, 2003 at 12:02:30PM +0100, Matt Wright wrote:
 > powernow: Has 14 PST tables. (Only dumping ones relevant to this CPU).
 > 
 > Nothing else, it doesn't seem to dump and PST tables (as other examples
 > I've seen show the driver reporting extra info about the CPU).

This typically means that of all the PST tables, none of them had
the same cpuid. I should put in a check for this, and printk something.
BIOS upgrade ? If there isn't one, let me know what manufacturer/model,
and I'll ask AMD if they'll 'send the heavies around'.

 > If I execute the following command:
 > echo "5000000:17000000:performance" > /proc/cpufreq
 > 
 > Then the module panics and I get the following in dmesg
 > 
 > Unable to handle kernel NULL pointer dereference at virtual address
 > 00000004

Ouch, that shouldn't happen no matter what.

 > Call Trace:    [<ccd157e8>] [<c012860e>] [<c0194838>] [<c015dce0>]
 > [<c013c1d3>]
 >   [<c0108dc7>]
 >  
 > Code: 8b 45 04 31 c9 83 f8 fe 74 1b 83 f8 ff 74 0c 3b 43 04 72 5a

Can you run that oops through ksymoops to decode the addresses
to symbols ?

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk

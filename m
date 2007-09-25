From: Dave Jones <davej@redhat.com>
Subject: Re: writing a frequency scaling processor module
Date: Tue, 25 Sep 2007 13:02:42 -0400
Message-ID: <20070925170242.GF2769@redhat.com>
References: <556445368AFA1C438794ABDA8901891C066B5BD9@USA0300MS03.na.xerox.net>
	<20070924233135.GK8127@redhat.com>
	<556445368AFA1C438794ABDA8901891C06460088@USA0300MS03.na.xerox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <556445368AFA1C438794ABDA8901891C06460088@USA0300MS03.na.xerox.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: "Leisner, Martin" <Martin.Leisner@xerox.com>
Cc: cpufreq@lists.linux.org.uk

On Tue, Sep 25, 2007 at 12:48:55PM -0400, Leisner, Martin wrote:
 > Its pretty much written...it could (should) be very simple...
 > in a simple case...
 > 
 > All it really needed was:
 >    1) a method to set the frequency
 >    2) a method to get the frequency
 >    3) a frequency array
 > 
 > I copied some code from the powernow-k7...and banged on it until it worked...
 > 
 > Why does 
 > cpufreq_frequency_table have an index entry on each entry?

When searching through the table for an entry, it's used as
a 'key' to find the match.

	Dave

-- 
http://www.codemonkey.org.uk

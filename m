From: Dave Jones <davej@redhat.com>
Subject: Re: Dynamic frequency governor
Date: Wed, 22 Oct 2003 00:19:54 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021231953.GB1528@redhat.com>
References: <20031021203122.GC871@redhat.com>
	<Pine.LNX.4.44.0310211744210.27611-100000@cat.eecg.toronto.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0310211744210.27611-100000@cat.eecg.toronto.edu>
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
To: David Kar-Fai Tam <tamda@eecg.toronto.edu>
Cc: cpufreq@www.linux.org.uk

On Tue, Oct 21, 2003 at 06:21:37PM -0400, David Kar-Fai Tam wrote:

 > I did a quick text search on the website of the above address and I 
 > couldn't find "voltage" mentioned anywhere. That is, I couldn't find any 
 > mention of dynamic "voltage" scaling as a technique for saving power.
 > They only talk about is using the technique of "frequency" scaling to 
 > save power.
 > 
 > With DVS algorithms, we are attempting to dynamically change the voltage 
 > to save power. The fact that the frequency varies is just a side effect.

Not all implementations can scale voltage.

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk

From: Dave Jones <davej@redhat.com>
Subject: Re: longhaul: Unknown VIA CPU
Date: Wed, 3 Sep 2003 13:00:39 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030903120038.GF1225@redhat.com>
References: <3F55187F.70707@free.fr> <1062596994.574.1.camel@sven>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1062596994.574.1.camel@sven>
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
To: Sven Dowideit <svenud@ozemail.com.au>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 03, 2003 at 11:49:55PM +1000, Sven Dowideit wrote:
 > I sent DaveJones a patch that at least says that the Nehemiah is not
 > implemented, but i have not heard from him since..

sorry, I thought I replied..

 > also, the email
 > address will need to be changed to the codemonkey one :)

Already fixed in 2.6, not sure about the 2.4/2.4-ac backports.

 > However, VIA have not yet made that info available to the public (I'm
 > hoping Dave has a copy)

I have the relevant documentation, and a Nehemiah that should support
power scaling, however when I try to use it according to how the spec
says I should I get nonsense returned from certain MSRs, and no speed
change.  I'm still waiting to hear back from Centaur.

I pinged them again yesterday, hopefully I can get an answer on
this pretty soon.

		Dave

-- 
 Dave Jones     http://www.codemonkey.org.uk

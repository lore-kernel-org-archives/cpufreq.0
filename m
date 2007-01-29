From: Chuck Ebbert <cebbert@redhat.com>
Subject: Re: 2.6.20rc5 k8/acpi regression ( 2.6.17.13 works fine ).
Date: Mon, 29 Jan 2007 17:30:28 -0500
Message-ID: <45BE7584.8040808@redhat.com>
References: <200701242346.44673.pluto@agmk.net>
	<20070124225238.GT17836@stusta.de>
	<200701242350.45276.lenb@kernel.org>
	<200701252311.46858.pluto@agmk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200701252311.46858.pluto@agmk.net>
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
Content-Type: text/plain; charset="windows-1254"
To: =?UTF-8?B?UGF3ZcWCIFNpa29yYQ==?= <pluto@agmk.net>
Cc: linux-acpi@vger.kernel.org, cpufreq@lists.linux.org.uk, Adrian Bunk <bunk@stusta.de>, linux-kernel@vger.kernel.org

UGF3ZcWCIFNpa29yYSB3cm90ZToKPiBPbiBUaHVyc2RheSAyNSBvZiBKYW51YXJ5IDIwMDcgMDU6
NTA6NDUgTGVuIEJyb3duIHdyb3RlOgo+ICAgCj4+IE9uIFdlZG5lc2RheSAyNCBKYW51YXJ5IDIw
MDcgMTc6NTIsIEFkcmlhbiBCdW5rIHdyb3RlOgo+PiAgICAgCj4+PiBPbiBXZWQsIEphbiAyNCwg
MjAwNyBhdCAxMTo0Njo0NFBNICswMTAwLCBQYXdlxYIgU2lrb3JhIHdyb3RlOgo+Pj4gICAgICAg
Cj4+Pj4gZm9yIDIuNi4yMHJjNSBpIGdldCBhbiBhY3BpIHJlbGF0ZWQgb29wcyBkdXJpbmcgeDg2
LTY0IGJvb3Q6Cj4+Pj4gaHR0cDovL21pbnVzLmRzMTQuYWdoLmVkdS5wbC9+cGx1dG8vMi42LjIw
cmM1LWFjcGktb29wcy5qcGcKPj4+PiBkaXNhYmxpbmcgdGhlICJhbWQtazggY29vbCduJ3F1aWV0
IiBvcHRpb24gaW4gYmlvcyBoZWxwcy4KPj4+PiBtb3Jlb3ZlciwgaXQgd29ya3MgZmluZSBmb3Ig
Mi42LjE3LjEzLCBzbyBpdCBsb29rcyBsaWtlCj4+Pj4gYSByZWNlbnQgcmVncmVzc2lvbi4gaSBj
YW4gcHJvdmlkZSBtb3JlIGRldGFpbHMgaWYgeW91IG5lZWQuCj4+Pj4gICAgICAgICAKPj4+IHRo
YW5rcyBmb3IgeW91ciByZXBvcnQuCj4+Pgo+Pj4gQ2FuIHlvdSBuYXJyb3cgZG93biBhIGJpdCB3
aGVuIGl0IHN0YXJ0ZWQ/Cj4+PiBJcyAyLjYuMTkgT0s/Cj4+PiBJcyAyLjYuMTggT0s/Cj4+PiAg
ICAgICAKPj4gSXMgdGhlIHN0YWNrIHRyYWNlIGFsd2F5cyB0aGUgc2FtZT8gIEl0IGRvZXNuJ3Qg
bWFrZSBtdWNoIHNlbnNlIHRvIG1lLgo+PiAgICAgCj4KPiB3aXRoIGRlYnVnIG9wdGlvbnMgZW5h
YmxlZCBvb3BzIGxvb2tzIGJldHRlcjoKPiBodHRwOi8vbWludXMuZHMxNC5hZ2guZWR1LnBsL35w
bHV0by8yLjYuMjByYzUtb29wcy0wMS5qcGcKPgo+ICAgCgpJbiBfX3JtcXVldWUoKSAobW0vcGFn
ZV9hbGxvYy5jIGxpbmUgNjE5OgoKc3RhdGljIHN0cnVjdCBwYWdlICpfX3JtcXVldWUoc3RydWN0
IHpvbmUgKnpvbmUsIHVuc2lnbmVkIGludCBvcmRlcikKewogICAgICAgIHN0cnVjdCBmcmVlX2Fy
ZWEgKiBhcmVhOwogICAgICAgIHVuc2lnbmVkIGludCBjdXJyZW50X29yZGVyOwogICAgICAgIHN0
cnVjdCBwYWdlICpwYWdlOwoKICAgICAgICBmb3IgKGN1cnJlbnRfb3JkZXIgPSBvcmRlcjsgY3Vy
cmVudF9vcmRlciA8IE1BWF9PUkRFUjsKKytjdXJyZW50X29yZGVyKSB7CiAgICAgICAgICAgICAg
ICBhcmVhID0gem9uZS0+ZnJlZV9hcmVhICsgY3VycmVudF9vcmRlcjsKICAgICAgICAgICAgICAg
IGlmIChsaXN0X2VtcHR5KCZhcmVhLT5mcmVlX2xpc3QpKQogICAgICAgICAgICAgICAgICAgICAg
ICBjb250aW51ZTsKCiAgICAgICAgICAgICAgICBwYWdlID0gbGlzdF9lbnRyeShhcmVhLT5mcmVl
X2xpc3QubmV4dCwgc3RydWN0IHBhZ2UsIGxydSk7CiAgICAgICAgICAgICAgICBsaXN0X2RlbCgm
cGFnZS0+bHJ1KTsgICA8PT09PT09PT09PT09PT09PT09PT09CiAgICAgICAgICAgICAgICBybXZf
cGFnZV9vcmRlcihwYWdlKTsKICAgICAgICAgICAgICAgIGFyZWEtPm5yX2ZyZWUtLTsKCnBhZ2Ut
PmxydSBpcyBOVUxM
